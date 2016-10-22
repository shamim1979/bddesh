package com.bddesh24

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['ROLE_SUPERADMIN'])
@Transactional(readOnly = true)
class AnswerCommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AnswerComment.list(params), model:[answerCommentInstanceCount: AnswerComment.count()]
    }

    def show(AnswerComment answerCommentInstance) {
        respond answerCommentInstance
    }

    def create() {
        respond new AnswerComment(params)
    }

    @Transactional
    def save(AnswerComment answerCommentInstance) {
        if (answerCommentInstance == null) {
            notFound()
            return
        }

        if (answerCommentInstance.hasErrors()) {
            respond answerCommentInstance.errors, view:'create'
            return
        }

        answerCommentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'answerComment.label', default: 'AnswerComment'), answerCommentInstance.id])
                redirect answerCommentInstance
            }
            '*' { respond answerCommentInstance, [status: CREATED] }
        }
    }

    def edit(AnswerComment answerCommentInstance) {
        respond answerCommentInstance
    }

    @Transactional
    def update(AnswerComment answerCommentInstance) {
        if (answerCommentInstance == null) {
            notFound()
            return
        }

        if (answerCommentInstance.hasErrors()) {
            respond answerCommentInstance.errors, view:'edit'
            return
        }

        answerCommentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AnswerComment.label', default: 'AnswerComment'), answerCommentInstance.id])
                redirect answerCommentInstance
            }
            '*'{ respond answerCommentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AnswerComment answerCommentInstance) {

        if (answerCommentInstance == null) {
            notFound()
            return
        }

        answerCommentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AnswerComment.label', default: 'AnswerComment'), answerCommentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerComment.label', default: 'AnswerComment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
