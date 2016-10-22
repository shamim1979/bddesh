package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class PollItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PollItem.list(params), model:[pollItemInstanceCount: PollItem.count()]
    }

    def show(PollItem pollItemInstance) {
        respond pollItemInstance
    }

    def create() {
        respond new PollItem(params)
    }

    @Transactional
    def save(PollItem pollItemInstance) {
        if (pollItemInstance == null) {
            notFound()
            return
        }

        if (pollItemInstance.hasErrors()) {
            respond pollItemInstance.errors, view:'create'
            return
        }

        pollItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pollItem.label', default: 'PollItem'), pollItemInstance.id])
                redirect pollItemInstance
            }
            '*' { respond pollItemInstance, [status: CREATED] }
        }
    }

    def edit(PollItem pollItemInstance) {
        respond pollItemInstance
    }

    @Transactional
    def update(PollItem pollItemInstance) {
        if (pollItemInstance == null) {
            notFound()
            return
        }

        if (pollItemInstance.hasErrors()) {
            respond pollItemInstance.errors, view:'edit'
            return
        }

        pollItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PollItem.label', default: 'PollItem'), pollItemInstance.id])
                redirect pollItemInstance
            }
            '*'{ respond pollItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PollItem pollItemInstance) {

        if (pollItemInstance == null) {
            notFound()
            return
        }

        pollItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PollItem.label', default: 'PollItem'), pollItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pollItem.label', default: 'PollItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
