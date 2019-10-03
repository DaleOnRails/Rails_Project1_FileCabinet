class DocsController < ApplicationController

  #shows all docs in index view
  def index
  end

  #shows single doc, will create the show for view
  def show
  end

  #for creating a new view - related to create method because to actually render a new view i need to create something
  def new
  end

  #create method does not have a view itself. It makes changes to a database using the edit view.
  def create
  end

  #update action is responsible for editing views
  def edit
  end

  #update does not have a view itself. it just makes changes to the databse using the edit view.
  def update
  end

  #deletes the documents created
  def destroy
  end

  #these private methods apply to this controllers code.
  #PM's purpose is to reduce repeated code that shows up everywhere. instead i can just use these private methods and apply them to the rest of the methods.
  private

  def find_doc
  end

  def doc_params
  end
end
