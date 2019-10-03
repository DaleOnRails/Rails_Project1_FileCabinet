class DocsController < ApplicationController
  #run the find_doc private method first to get a docs id.
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  #--2-- create crud methods for a document
  #shows all docs in index view
  def index
    #display files in descending order
    @docs = Doc.all.order("created_at DESC")
  end

  #shows single doc, will create the show for view.
  #show is already taken care of because of the before action.
  def show
  end

  #for creating a new view - related to create method because to actually render a new view i need to create something
  def new
    #creates a new document
    @doc = Doc.new
  end

  #--5--
  #create method does not have a view itself. It makes changes to a database using the edit view.
  def create
    #creates a new document and also its parameters(its title and its content)
    @doc = Doc.new(doc_params)

    #says if the doc is saved then get the application to redirect the user to the document that was #just created/saved.
    if @doc.save
      redirect_to @doc
      #    says if it fails to save then render the doc again so the user can have another go at saving it.
      #    The reason why render 'new' is used here instead of 'redirect_to' is because redirect_to is a NEW http refresh. Meaning if the user has a long document and a save fails then if we used redireect_to they would lose all of their previous work!
      #   but render does not refresh the page. It keeps the user where they are and they get to have another go at saving the doc.
    else
      render "new"
    end
  end

  #update action is responsible for editing views
  #edit is already taken care of because of the before action.
  def edit
  end

  # DIFFERENCE BETWEEN EDIT AND UPDATE:
  # -EDIT is just responsible for the specific view file like show when doc paremeters are already created.

  # -UPDATE however does the same  as the create method. It actually fetches that doc with the before action and then it changes the parameters

  #update does not have a view itself. it just makes changes to the databse using the edit view.
  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render "edit"
    end
  end

  #deletes the documents created
  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  #these private methods apply to this controllers code.
  #PM's purpose is to reduce repeated code that shows up everywhere. instead i can just use these private methods and apply them to the rest of the methods.
  private

  def find_doc
    #says to find the document we want to display by its params ID
    @doc = Doc.find(params[:id])
  end

  #--6--
  def doc_params
    #this method DEFINES the parameters of a document. It 'permits' a doc to have these attributes.
    params.require(:doc).permit(:title, :content)
  end
end
