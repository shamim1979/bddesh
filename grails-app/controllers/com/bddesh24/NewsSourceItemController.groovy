package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class NewsSourceItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewsSourceItem.list(params), model:[newsSourceItemInstanceCount: NewsSourceItem.count()]
    }

    def show(NewsSourceItem newsSourceItemInstance) {
        respond newsSourceItemInstance
    }

    def create() {
        respond new NewsSourceItem(params)
    }

    @Transactional
    def save(NewsSourceItem newsSourceItemInstance) {
        if (newsSourceItemInstance == null) {
            notFound()
            return
        }

        if (newsSourceItemInstance.hasErrors()) {
            respond newsSourceItemInstance.errors, view:'create'
            return
        }

        newsSourceItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsSourceItem.label', default: 'NewsSourceItem'), newsSourceItemInstance.id])
                redirect newsSourceItemInstance
            }
            '*' { respond newsSourceItemInstance, [status: CREATED] }
        }
    }

    def edit(NewsSourceItem newsSourceItemInstance) {
        respond newsSourceItemInstance
    }

    @Transactional
    def update(NewsSourceItem newsSourceItemInstance) {
        if (newsSourceItemInstance == null) {
            notFound()
            return
        }

        if (newsSourceItemInstance.hasErrors()) {
            respond newsSourceItemInstance.errors, view:'edit'
            return
        }

        newsSourceItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewsSourceItem.label', default: 'NewsSourceItem'), newsSourceItemInstance.id])
                redirect newsSourceItemInstance
            }
            '*'{ respond newsSourceItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewsSourceItem newsSourceItemInstance) {

        if (newsSourceItemInstance == null) {
            notFound()
            return
        }

        newsSourceItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewsSourceItem.label', default: 'NewsSourceItem'), newsSourceItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsSourceItem.label', default: 'NewsSourceItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
