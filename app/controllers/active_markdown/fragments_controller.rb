module ActiveMarkdown
  class FragmentsController < ApplicationController
    before_action :set_fragment, only: [:edit]

    def edit 
      
    end
    
    def create 
      @document = Document.find(params[:document_id])
      @proceeding_fragment = Fragment.find(fragment_params[:proceeding_fragment_id])
      @fragment = @document.add_new_fragment(@proceeding_fragment.position, fragment_params[:content])
      
      if @fragment
        respond_to do |format|
          # format.html {redirect_to main_app.edit_article_path(@fragment.document.article)}
          format.turbo_stream
        end
      end

    end

    def update 
      # If user press enter key, insert new fragment below
      # if params[:commit] == "enter-key"
      #   @document.add_new_fragment(@fragment.position)
      # # else
      #   redirect_to edit_fragment_path(@fragment)
      # end
      Rails.error.handle do
        @fragment = Fragment.find(params[:id])
        @fragment.assign_attributes(fragment_params)

        @fragment.apply_inline_formats()

        if params[:commit] == "blurred"
          @fragment.editing = false
        end

        if @fragment.save
          flash[:notice] = "Saved"
        else
          flash[:alert] = "Could not save"
        end
        render :edit
      end
      # redirect_to edit_fragment_path(@fragment)
      # redirect_to main_app.edit_article_path(@fragment.document)
    end

    def destroy 
      @fragment = Fragment.find(params[:id])
      document = @fragment.document
      if document.remove_fragment(@fragment)
        respond_to do |format|
          format.turbo_stream
        end
      end
    end
    

    private
      def set_fragment 
        @fragment = Fragment.find(params[:id])
      end

      def fragment_params 
        params.require(:fragment).permit(:position, :content, :is_new, :element, :editing, 
                :proceeding_fragment_id, :format, :caret_start, :caret_end)
      end
  end
end
