package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class NewsSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewsSource.list(params), model:[newsSourceInstanceCount: NewsSource.count()]
    }

    def show(NewsSource newsSourceInstance) {
        respond newsSourceInstance
    }

    def create() {
        respond new NewsSource(params)
    }

    @Transactional
    def save(NewsSource newsSourceInstance) {
        if (newsSourceInstance == null) {
            notFound()
            return
        }

        if (newsSourceInstance.hasErrors()) {
            respond newsSourceInstance.errors, view:'create'
            return
        }

        newsSourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsSource.label', default: 'NewsSource'), newsSourceInstance.id])
                redirect newsSourceInstance
            }
            '*' { respond newsSourceInstance, [status: CREATED] }
        }
    }

    def edit(NewsSource newsSourceInstance) {
        respond newsSourceInstance
    }

    @Transactional
    def update(NewsSource newsSourceInstance) {
        if (newsSourceInstance == null) {
            notFound()
            return
        }

        if (newsSourceInstance.hasErrors()) {
            respond newsSourceInstance.errors, view:'edit'
            return
        }

        newsSourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewsSource.label', default: 'NewsSource'), newsSourceInstance.id])
                redirect newsSourceInstance
            }
            '*'{ respond newsSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewsSource newsSourceInstance) {

        if (newsSourceInstance == null) {
            notFound()
            return
        }

        newsSourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewsSource.label', default: 'NewsSource'), newsSourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsSource.label', default: 'NewsSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
