module ActiveMarkdown
  class FragmentsController < ApplicationController
    before_action :set_fragment, only: [:update]
    def update 
      @fragment.update(data)
    end

    private
      def set_fragment 
        @fragment = Fragment.find(params[:id])
      end

      def fragment_params 
        params.require(:fragment).
      end
  end
end
