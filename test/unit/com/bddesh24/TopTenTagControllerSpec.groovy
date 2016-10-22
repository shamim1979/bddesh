package com.bddesh24



import grails.test.mixin.*
import spock.lang.*

@TestFor(TopTenTagController)
@Mock(TopTenTag)
class TopTenTagControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.topTenTagInstanceList
            model.topTenTagInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.topTenTagInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def topTenTag = new TopTenTag()
            topTenTag.validate()
            controller.save(topTenTag)

        then:"The create view is rendered again with the correct model"
            model.topTenTagInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            topTenTag = new TopTenTag(params)

            controller.save(topTenTag)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/topTenTag/show/1'
            controller.flash.message != null
            TopTenTag.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def topTenTag = new TopTenTag(params)
            controller.show(topTenTag)

        then:"A model is populated containing the domain instance"
            model.topTenTagInstance == topTenTag
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def topTenTag = new TopTenTag(params)
            controller.edit(topTenTag)

        then:"A model is populated containing the domain instance"
            model.topTenTagInstance == topTenTag
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/topTenTag/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def topTenTag = new TopTenTag()
            topTenTag.validate()
            controller.update(topTenTag)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.topTenTagInstance == topTenTag

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            topTenTag = new TopTenTag(params).save(flush: true)
            controller.update(topTenTag)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/topTenTag/show/$topTenTag.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/topTenTag/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def topTenTag = new TopTenTag(params).save(flush: true)

        then:"It exists"
            TopTenTag.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(topTenTag)

        then:"The instance is deleted"
            TopTenTag.count() == 0
            response.redirectedUrl == '/topTenTag/index'
            flash.message != null
    }
}
