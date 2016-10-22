package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class TopTenTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TopTenTag.list(params), model:[topTenTagInstanceCount: TopTenTag.count()]
    }

    def show(TopTenTag topTenTagInstance) {
        respond topTenTagInstance
    }

    def create() {
        respond new TopTenTag(params)
    }

    @Transactional
    def save(TopTenTag topTenTagInstance) {
        if (topTenTagInstance == null) {
            notFound()
            return
        }

        if (topTenTagInstance.hasErrors()) {
            respond topTenTagInstance.errors, view:'create'
            return
        }

        topTenTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topTenTag.label', default: 'TopTenTag'), topTenTagInstance.id])
                redirect topTenTagInstance
            }
            '*' { respond topTenTagInstance, [status: CREATED] }
        }
    }

    def edit(TopTenTag topTenTagInstance) {
        respond topTenTagInstance
    }

    @Transactional
    def update(TopTenTag topTenTagInstance) {
        if (topTenTagInstance == null) {
            notFound()
            return
        }

        if (topTenTagInstance.hasErrors()) {
            respond topTenTagInstance.errors, view:'edit'
            return
        }

        topTenTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TopTenTag.label', default: 'TopTenTag'), topTenTagInstance.id])
                redirect topTenTagInstance
            }
            '*'{ respond topTenTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TopTenTag topTenTagInstance) {

        if (topTenTagInstance == null) {
            notFound()
            return
        }

        topTenTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TopTenTag.label', default: 'TopTenTag'), topTenTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topTenTag.label', default: 'TopTenTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
