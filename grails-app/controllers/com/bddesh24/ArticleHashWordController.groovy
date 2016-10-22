package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class ArticleHashWordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ArticleHashWord.list(params), model:[articleHashWordInstanceCount: ArticleHashWord.count()]
    }

    def show(ArticleHashWord articleHashWordInstance) {
        respond articleHashWordInstance
    }

    def create() {
        respond new ArticleHashWord(params)
    }

    @Transactional
    def save(ArticleHashWord articleHashWordInstance) {
        if (articleHashWordInstance == null) {
            notFound()
            return
        }

        if (articleHashWordInstance.hasErrors()) {
            respond articleHashWordInstance.errors, view:'create'
            return
        }

        articleHashWordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'articleHashWord.label', default: 'ArticleHashWord'), articleHashWordInstance.id])
                redirect articleHashWordInstance
            }
            '*' { respond articleHashWordInstance, [status: CREATED] }
        }
    }

    def edit(ArticleHashWord articleHashWordInstance) {
        respond articleHashWordInstance
    }

    @Transactional
    def update(ArticleHashWord articleHashWordInstance) {
        if (articleHashWordInstance == null) {
            notFound()
            return
        }

        if (articleHashWordInstance.hasErrors()) {
            respond articleHashWordInstance.errors, view:'edit'
            return
        }

        articleHashWordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ArticleHashWord.label', default: 'ArticleHashWord'), articleHashWordInstance.id])
                redirect articleHashWordInstance
            }
            '*'{ respond articleHashWordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ArticleHashWord articleHashWordInstance) {

        if (articleHashWordInstance == null) {
            notFound()
            return
        }

        articleHashWordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ArticleHashWord.label', default: 'ArticleHashWord'), articleHashWordInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'articleHashWord.label', default: 'ArticleHashWord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
