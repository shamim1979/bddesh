package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class QuestionTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QuestionTag.list(params), model:[questionTagInstanceCount: QuestionTag.count()]
    }

    def show(QuestionTag questionTagInstance) {
        respond questionTagInstance
    }

    def create() {
        respond new QuestionTag(params)
    }

    @Transactional
    def save(QuestionTag questionTagInstance) {
        if (questionTagInstance == null) {
            notFound()
            return
        }

        if (questionTagInstance.hasErrors()) {
            respond questionTagInstance.errors, view:'create'
            return
        }

        questionTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionTag.label', default: 'QuestionTag'), questionTagInstance.id])
                redirect questionTagInstance
            }
            '*' { respond questionTagInstance, [status: CREATED] }
        }
    }

    def edit(QuestionTag questionTagInstance) {
        respond questionTagInstance
    }

    @Transactional
    def update(QuestionTag questionTagInstance) {
        if (questionTagInstance == null) {
            notFound()
            return
        }

        if (questionTagInstance.hasErrors()) {
            respond questionTagInstance.errors, view:'edit'
            return
        }

        questionTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'QuestionTag.label', default: 'QuestionTag'), questionTagInstance.id])
                redirect questionTagInstance
            }
            '*'{ respond questionTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(QuestionTag questionTagInstance) {

        if (questionTagInstance == null) {
            notFound()
            return
        }

        questionTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'QuestionTag.label', default: 'QuestionTag'), questionTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionTag.label', default: 'QuestionTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
