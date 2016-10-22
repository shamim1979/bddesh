package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class NewsSourceTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewsSourceTag.list(params), model:[newsSourceTagInstanceCount: NewsSourceTag.count()]
    }

    def show(NewsSourceTag newsSourceTagInstance) {
        respond newsSourceTagInstance
    }

    def create() {
        respond new NewsSourceTag(params)
    }

    @Transactional
    def save(NewsSourceTag newsSourceTagInstance) {
        if (newsSourceTagInstance == null) {
            notFound()
            return
        }

        if (newsSourceTagInstance.hasErrors()) {
            respond newsSourceTagInstance.errors, view:'create'
            return
        }

        newsSourceTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsSourceTag.label', default: 'NewsSourceTag'), newsSourceTagInstance.id])
                redirect newsSourceTagInstance
            }
            '*' { respond newsSourceTagInstance, [status: CREATED] }
        }
    }

    def edit(NewsSourceTag newsSourceTagInstance) {
        respond newsSourceTagInstance
    }

    @Transactional
    def update(NewsSourceTag newsSourceTagInstance) {
        if (newsSourceTagInstance == null) {
            notFound()
            return
        }

        if (newsSourceTagInstance.hasErrors()) {
            respond newsSourceTagInstance.errors, view:'edit'
            return
        }

        newsSourceTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewsSourceTag.label', default: 'NewsSourceTag'), newsSourceTagInstance.id])
                redirect newsSourceTagInstance
            }
            '*'{ respond newsSourceTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewsSourceTag newsSourceTagInstance) {

        if (newsSourceTagInstance == null) {
            notFound()
            return
        }

        newsSourceTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewsSourceTag.label', default: 'NewsSourceTag'), newsSourceTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsSourceTag.label', default: 'NewsSourceTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
