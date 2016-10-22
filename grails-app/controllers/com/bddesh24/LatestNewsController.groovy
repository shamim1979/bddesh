package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class LatestNewsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LatestNews.list(params), model:[latestNewsInstanceCount: LatestNews.count()]
    }

    def show(LatestNews latestNewsInstance) {
        respond latestNewsInstance
    }

    def create() {
        respond new LatestNews(params)
    }

    @Transactional
    def save(LatestNews latestNewsInstance) {
        if (latestNewsInstance == null) {
            notFound()
            return
        }

        if (latestNewsInstance.hasErrors()) {
            respond latestNewsInstance.errors, view:'create'
            return
        }

        latestNewsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'latestNews.label', default: 'LatestNews'), latestNewsInstance.id])
                redirect latestNewsInstance
            }
            '*' { respond latestNewsInstance, [status: CREATED] }
        }
    }

    def edit(LatestNews latestNewsInstance) {
        respond latestNewsInstance
    }

    @Transactional
    def update(LatestNews latestNewsInstance) {
        if (latestNewsInstance == null) {
            notFound()
            return
        }

        if (latestNewsInstance.hasErrors()) {
            respond latestNewsInstance.errors, view:'edit'
            return
        }

        latestNewsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LatestNews.label', default: 'LatestNews'), latestNewsInstance.id])
                redirect latestNewsInstance
            }
            '*'{ respond latestNewsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LatestNews latestNewsInstance) {

        if (latestNewsInstance == null) {
            notFound()
            return
        }

        latestNewsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LatestNews.label', default: 'LatestNews'), latestNewsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'latestNews.label', default: 'LatestNews'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
