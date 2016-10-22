package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class ArticleCommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ArticleComment.list(params), model:[articleCommentInstanceCount: ArticleComment.count()]
    }

    def show(ArticleComment articleCommentInstance) {
        respond articleCommentInstance
    }

    def create() {
        respond new ArticleComment(params)
    }

    @Transactional
    def save(ArticleComment articleCommentInstance) {
        if (articleCommentInstance == null) {
            notFound()
            return
        }

        if (articleCommentInstance.hasErrors()) {
            respond articleCommentInstance.errors, view:'create'
            return
        }

        articleCommentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'articleComment.label', default: 'ArticleComment'), articleCommentInstance.id])
                redirect articleCommentInstance
            }
            '*' { respond articleCommentInstance, [status: CREATED] }
        }
    }

    def edit(ArticleComment articleCommentInstance) {
        respond articleCommentInstance
    }

    @Transactional
    def update(ArticleComment articleCommentInstance) {
        if (articleCommentInstance == null) {
            notFound()
            return
        }

        if (articleCommentInstance.hasErrors()) {
            respond articleCommentInstance.errors, view:'edit'
            return
        }

        articleCommentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ArticleComment.label', default: 'ArticleComment'), articleCommentInstance.id])
                redirect articleCommentInstance
            }
            '*'{ respond articleCommentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ArticleComment articleCommentInstance) {

        if (articleCommentInstance == null) {
            notFound()
            return
        }

        articleCommentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ArticleComment.label', default: 'ArticleComment'), articleCommentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'articleComment.label', default: 'ArticleComment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
