package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class PollController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poll.list(params), model:[pollInstanceCount: Poll.count()]
    }

    def show(Poll pollInstance) {
        respond pollInstance
    }

    def create() {
        respond new Poll(params)
    }

    @Transactional
    def save(Poll pollInstance) {
        if (pollInstance == null) {
            notFound()
            return
        }

        if (pollInstance.hasErrors()) {
            respond pollInstance.errors, view:'create'
            return
        }

        pollInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poll.label', default: 'Poll'), pollInstance.id])
                redirect pollInstance
            }
            '*' { respond pollInstance, [status: CREATED] }
        }
    }

    def edit(Poll pollInstance) {
        respond pollInstance
    }

    @Transactional
    def update(Poll pollInstance) {
        if (pollInstance == null) {
            notFound()
            return
        }

        if (pollInstance.hasErrors()) {
            respond pollInstance.errors, view:'edit'
            return
        }

        pollInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Poll.label', default: 'Poll'), pollInstance.id])
                redirect pollInstance
            }
            '*'{ respond pollInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Poll pollInstance) {

        if (pollInstance == null) {
            notFound()
            return
        }

        pollInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Poll.label', default: 'Poll'), pollInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poll.label', default: 'Poll'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
