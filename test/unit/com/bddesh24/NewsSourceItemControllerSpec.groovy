package com.bddesh24



import grails.test.mixin.*
import spock.lang.*

@TestFor(NewsSourceItemController)
@Mock(NewsSourceItem)
class NewsSourceItemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.newsSourceItemInstanceList
            model.newsSourceItemInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.newsSourceItemInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def newsSourceItem = new NewsSourceItem()
            newsSourceItem.validate()
            controller.save(newsSourceItem)

        then:"The create view is rendered again with the correct model"
            model.newsSourceItemInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            newsSourceItem = new NewsSourceItem(params)

            controller.save(newsSourceItem)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/newsSourceItem/show/1'
            controller.flash.message != null
            NewsSourceItem.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def newsSourceItem = new NewsSourceItem(params)
            controller.show(newsSourceItem)

        then:"A model is populated containing the domain instance"
            model.newsSourceItemInstance == newsSourceItem
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def newsSourceItem = new NewsSourceItem(params)
            controller.edit(newsSourceItem)

        then:"A model is populated containing the domain instance"
            model.newsSourceItemInstance == newsSourceItem
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/newsSourceItem/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def newsSourceItem = new NewsSourceItem()
            newsSourceItem.validate()
            controller.update(newsSourceItem)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.newsSourceItemInstance == newsSourceItem

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            newsSourceItem = new NewsSourceItem(params).save(flush: true)
            controller.update(newsSourceItem)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/newsSourceItem/show/$newsSourceItem.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/newsSourceItem/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def newsSourceItem = new NewsSourceItem(params).save(flush: true)

        then:"It exists"
            NewsSourceItem.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(newsSourceItem)

        then:"The instance is deleted"
            NewsSourceItem.count() == 0
            response.redirectedUrl == '/newsSourceItem/index'
            flash.message != null
    }
}
