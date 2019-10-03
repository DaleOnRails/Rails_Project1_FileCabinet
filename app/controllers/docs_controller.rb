class DocsController < ApplicationController

  #shows all docs in index view
  def index
  end

  #shows single doc, will create the show for view.
  def show
  end

  #for creating a new view - related to create method because to actually render a new view i need to create something
  def new
    #creates a new document
    @doc = Doc.new
  end

  #create method does not have a view itself. It makes changes to a database using the edit view.
  def create
    #creates a new document and also its parameters(its title and its content)
    @doc = Doc.new(doc_params)

    #says if the doc is saved then get the application to redirect the user to the document that was just created/saved.
    if @doc.save
      redirect_to @doc
      #says if it fails to save then render the doc again so the user can have another go at saving it.
      #The reason why render 'new' is used here instead of 'redirect_to' is because redirect_to is a NEW http refresh. Meaning if the user has a long document and a save fails then if we used redireect_to they would lose all of their previous work!
      #but render does not refresh the page. It keeps the user where they are and they get to have another go at saving the doc.
    else
      render "new"
    end
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
    #this method DEFINES the parameters of a document. It 'permits' a doc to have these attributes.
    params.require(:doc).permit(:title, :content)
  end
end
