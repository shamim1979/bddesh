package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class TopTenOpinionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TopTenOpinion.list(params), model:[topTenOpinionInstanceCount: TopTenOpinion.count()]
    }

    def show(TopTenOpinion topTenOpinionInstance) {
        respond topTenOpinionInstance
    }

    def create() {
        respond new TopTenOpinion(params)
    }

    @Transactional
    def save(TopTenOpinion topTenOpinionInstance) {
        if (topTenOpinionInstance == null) {
            notFound()
            return
        }

        if (topTenOpinionInstance.hasErrors()) {
            respond topTenOpinionInstance.errors, view:'create'
            return
        }

        topTenOpinionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topTenOpinion.label', default: 'TopTenOpinion'), topTenOpinionInstance.id])
                redirect topTenOpinionInstance
            }
            '*' { respond topTenOpinionInstance, [status: CREATED] }
        }
    }

    def edit(TopTenOpinion topTenOpinionInstance) {
        respond topTenOpinionInstance
    }

    @Transactional
    def update(TopTenOpinion topTenOpinionInstance) {
        if (topTenOpinionInstance == null) {
            notFound()
            return
        }

        if (topTenOpinionInstance.hasErrors()) {
            respond topTenOpinionInstance.errors, view:'edit'
            return
        }

        topTenOpinionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TopTenOpinion.label', default: 'TopTenOpinion'), topTenOpinionInstance.id])
                redirect topTenOpinionInstance
            }
            '*'{ respond topTenOpinionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TopTenOpinion topTenOpinionInstance) {

        if (topTenOpinionInstance == null) {
            notFound()
            return
        }

        topTenOpinionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TopTenOpinion.label', default: 'TopTenOpinion'), topTenOpinionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topTenOpinion.label', default: 'TopTenOpinion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
