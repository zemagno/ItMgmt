class AjaxController < ApplicationController
  
  def cis

    if params[:term] # && params[:term].size > 3
      like= "%".concat(params[:term].concat("%"))
      cis = Ci.where("chave like ?", like)
    else
      cis = Ci.all
    end
    list = cis.map {|u| Hash[ id: u.id, label: u.chave, name: u.chave]}
    render json: list
  end
end
