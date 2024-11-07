module ActiveMarkdown
  class DocumentsController < ApplicationController
    before_action :set_document, only: [:edit]

    def edit 
      # @fragment = Fragment.new
    end

    def update 
      
    end

    private
      def set_document 
        @document = Document.find(params[:id])
      end
  end
end
