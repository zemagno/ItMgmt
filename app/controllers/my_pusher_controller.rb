
class MyPusherController < ApplicationController
  def index
  end

  def publica
  	Pusher['test_channel'].trigger('my_event', {
      message: "INFRA.BRQ.COM #{params[:mensagem]}"
    })
  end
end
