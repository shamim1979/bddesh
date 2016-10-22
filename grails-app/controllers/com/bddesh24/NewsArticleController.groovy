package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class NewsArticleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewsArticle.list(params), model:[newsArticleInstanceCount: NewsArticle.count()]
    }

    def show(NewsArticle newsArticleInstance) {
        respond newsArticleInstance
    }

    def create() {
        respond new NewsArticle(params)
    }

    @Transactional
    def save(NewsArticle newsArticleInstance) {
        if (newsArticleInstance == null) {
            notFound()
            return
        }

        if (newsArticleInstance.hasErrors()) {
            respond newsArticleInstance.errors, view:'create'
            return
        }

        newsArticleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newsArticle.label', default: 'NewsArticle'), newsArticleInstance.id])
                redirect newsArticleInstance
            }
            '*' { respond newsArticleInstance, [status: CREATED] }
        }
    }

    def edit(NewsArticle newsArticleInstance) {
        respond newsArticleInstance
    }

    @Transactional
    def update(NewsArticle newsArticleInstance) {
        if (newsArticleInstance == null) {
            notFound()
            return
        }

        if (newsArticleInstance.hasErrors()) {
            respond newsArticleInstance.errors, view:'edit'
            return
        }

        newsArticleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewsArticle.label', default: 'NewsArticle'), newsArticleInstance.id])
                redirect newsArticleInstance
            }
            '*'{ respond newsArticleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewsArticle newsArticleInstance) {

        if (newsArticleInstance == null) {
            notFound()
            return
        }

        newsArticleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewsArticle.label', default: 'NewsArticle'), newsArticleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsArticle.label', default: 'NewsArticle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
