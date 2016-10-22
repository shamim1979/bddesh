package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class HashwordSetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HashwordSet.list(params), model:[hashwordSetInstanceCount: HashwordSet.count()]
    }

    def show(HashwordSet hashwordSetInstance) {
        respond hashwordSetInstance
    }

    def create() {
        respond new HashwordSet(params)
    }

    @Transactional
    def save(HashwordSet hashwordSetInstance) {
        if (hashwordSetInstance == null) {
            notFound()
            return
        }

        if (hashwordSetInstance.hasErrors()) {
            respond hashwordSetInstance.errors, view:'create'
            return
        }

        hashwordSetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hashwordSet.label', default: 'HashwordSet'), hashwordSetInstance.id])
                redirect hashwordSetInstance
            }
            '*' { respond hashwordSetInstance, [status: CREATED] }
        }
    }

    def edit(HashwordSet hashwordSetInstance) {
        respond hashwordSetInstance
    }

    @Transactional
    def update(HashwordSet hashwordSetInstance) {
        if (hashwordSetInstance == null) {
            notFound()
            return
        }

        if (hashwordSetInstance.hasErrors()) {
            respond hashwordSetInstance.errors, view:'edit'
            return
        }

        hashwordSetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HashwordSet.label', default: 'HashwordSet'), hashwordSetInstance.id])
                redirect hashwordSetInstance
            }
            '*'{ respond hashwordSetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(HashwordSet hashwordSetInstance) {

        if (hashwordSetInstance == null) {
            notFound()
            return
        }

        hashwordSetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HashwordSet.label', default: 'HashwordSet'), hashwordSetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hashwordSet.label', default: 'HashwordSet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
