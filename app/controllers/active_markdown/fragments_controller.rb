module ActiveMarkdown
  class FragmentsController < ApplicationController
    before_action :set_fragment, only: [:update, :edit]

    def edit 
      
    end

    def update 
      new_fragment_params = fragment_params
      new_fragment_params[:is_new] = false
      @fragment.update(new_fragment_params)
      @document = @fragment.document

      # If user press enter key, insert new fragment below
      if params[:commit] == "enter-key"
        @document.add_new_fragment(@fragment.position)
        redirect_to edit_document_path(@document)
      else
        redirect_to edit_fragment_path(@fragment)
      end

      # redirect_to main_app.edit_article_path(@fragment.document)
    end
    

    private
      def set_fragment 
        @fragment = Fragment.find(params[:id])
      end

      def fragment_params 
        params.require(:fragment).permit(:position, :content, :is_new, :element)
      end
  end
end
