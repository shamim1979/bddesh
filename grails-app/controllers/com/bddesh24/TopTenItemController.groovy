package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class TopTenItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TopTenItem.list(params), model:[topTenItemInstanceCount: TopTenItem.count()]
    }

    def show(TopTenItem topTenItemInstance) {
        respond topTenItemInstance
    }

    def create() {
        respond new TopTenItem(params)
    }

    @Transactional
    def save(TopTenItem topTenItemInstance) {
        if (topTenItemInstance == null) {
            notFound()
            return
        }

        if (topTenItemInstance.hasErrors()) {
            respond topTenItemInstance.errors, view:'create'
            return
        }

        topTenItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topTenItem.label', default: 'TopTenItem'), topTenItemInstance.id])
                redirect topTenItemInstance
            }
            '*' { respond topTenItemInstance, [status: CREATED] }
        }
    }

    def edit(TopTenItem topTenItemInstance) {
        respond topTenItemInstance
    }

    @Transactional
    def update(TopTenItem topTenItemInstance) {
        if (topTenItemInstance == null) {
            notFound()
            return
        }

        if (topTenItemInstance.hasErrors()) {
            respond topTenItemInstance.errors, view:'edit'
            return
        }

        topTenItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TopTenItem.label', default: 'TopTenItem'), topTenItemInstance.id])
                redirect topTenItemInstance
            }
            '*'{ respond topTenItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TopTenItem topTenItemInstance) {

        if (topTenItemInstance == null) {
            notFound()
            return
        }

        topTenItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TopTenItem.label', default: 'TopTenItem'), topTenItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topTenItem.label', default: 'TopTenItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
