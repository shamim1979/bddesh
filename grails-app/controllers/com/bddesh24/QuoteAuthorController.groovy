package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class QuoteAuthorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QuoteAuthor.list(params), model:[quoteAuthorInstanceCount: QuoteAuthor.count()]
    }

    def show(QuoteAuthor quoteAuthorInstance) {
        respond quoteAuthorInstance
    }

    def create() {
        respond new QuoteAuthor(params)
    }

    @Transactional
    def save(QuoteAuthor quoteAuthorInstance) {
        if (quoteAuthorInstance == null) {
            notFound()
            return
        }

        if (quoteAuthorInstance.hasErrors()) {
            respond quoteAuthorInstance.errors, view:'create'
            return
        }

        quoteAuthorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quoteAuthor.label', default: 'QuoteAuthor'), quoteAuthorInstance.id])
                redirect quoteAuthorInstance
            }
            '*' { respond quoteAuthorInstance, [status: CREATED] }
        }
    }

    def edit(QuoteAuthor quoteAuthorInstance) {
        respond quoteAuthorInstance
    }

    @Transactional
    def update(QuoteAuthor quoteAuthorInstance) {
        if (quoteAuthorInstance == null) {
            notFound()
            return
        }

        if (quoteAuthorInstance.hasErrors()) {
            respond quoteAuthorInstance.errors, view:'edit'
            return
        }

        quoteAuthorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'QuoteAuthor.label', default: 'QuoteAuthor'), quoteAuthorInstance.id])
                redirect quoteAuthorInstance
            }
            '*'{ respond quoteAuthorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(QuoteAuthor quoteAuthorInstance) {

        if (quoteAuthorInstance == null) {
            notFound()
            return
        }

        quoteAuthorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'QuoteAuthor.label', default: 'QuoteAuthor'), quoteAuthorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteAuthor.label', default: 'QuoteAuthor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
