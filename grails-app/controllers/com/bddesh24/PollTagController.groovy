package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class PollTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PollTag.list(params), model:[pollTagInstanceCount: PollTag.count()]
    }

    def show(PollTag pollTagInstance) {
        respond pollTagInstance
    }

    def create() {
        respond new PollTag(params)
    }

    @Transactional
    def save(PollTag pollTagInstance) {
        if (pollTagInstance == null) {
            notFound()
            return
        }

        if (pollTagInstance.hasErrors()) {
            respond pollTagInstance.errors, view:'create'
            return
        }

        pollTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pollTag.label', default: 'PollTag'), pollTagInstance.id])
                redirect pollTagInstance
            }
            '*' { respond pollTagInstance, [status: CREATED] }
        }
    }

    def edit(PollTag pollTagInstance) {
        respond pollTagInstance
    }

    @Transactional
    def update(PollTag pollTagInstance) {
        if (pollTagInstance == null) {
            notFound()
            return
        }

        if (pollTagInstance.hasErrors()) {
            respond pollTagInstance.errors, view:'edit'
            return
        }

        pollTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PollTag.label', default: 'PollTag'), pollTagInstance.id])
                redirect pollTagInstance
            }
            '*'{ respond pollTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PollTag pollTagInstance) {

        if (pollTagInstance == null) {
            notFound()
            return
        }

        pollTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PollTag.label', default: 'PollTag'), pollTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pollTag.label', default: 'PollTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
