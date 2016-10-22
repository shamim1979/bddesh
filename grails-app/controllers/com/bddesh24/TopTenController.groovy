package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class TopTenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TopTen.list(params), model:[topTenInstanceCount: TopTen.count()]
    }

    def show(TopTen topTenInstance) {
        respond topTenInstance
    }

    def create() {
        respond new TopTen(params)
    }

    @Transactional
    def save(TopTen topTenInstance) {
        if (topTenInstance == null) {
            notFound()
            return
        }

        if (topTenInstance.hasErrors()) {
            respond topTenInstance.errors, view:'create'
            return
        }

        topTenInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topTen.label', default: 'TopTen'), topTenInstance.id])
                redirect topTenInstance
            }
            '*' { respond topTenInstance, [status: CREATED] }
        }
    }

    def edit(TopTen topTenInstance) {
        respond topTenInstance
    }

    @Transactional
    def update(TopTen topTenInstance) {
        if (topTenInstance == null) {
            notFound()
            return
        }

        if (topTenInstance.hasErrors()) {
            respond topTenInstance.errors, view:'edit'
            return
        }

        topTenInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TopTen.label', default: 'TopTen'), topTenInstance.id])
                redirect topTenInstance
            }
            '*'{ respond topTenInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TopTen topTenInstance) {

        if (topTenInstance == null) {
            notFound()
            return
        }

        topTenInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TopTen.label', default: 'TopTen'), topTenInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topTen.label', default: 'TopTen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
