module ActiveMarkdown
  class DocumentsController < ApplicationController
    before_action :set_document, only: [:edit]

    def edit 
      
    end

    def update 
      
    end

    private
      def set_document 
        @document = Document.find(params[:id])
      end
  end
end
