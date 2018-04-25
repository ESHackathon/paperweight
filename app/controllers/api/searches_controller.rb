class Api::SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    ris = params[:ris].read
    @search = Search.new(ris: ris)

    if @search.save
      render json: @search.to_formatted_json
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:ris)
    end
end
