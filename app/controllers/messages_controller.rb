class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token  
  before_action :set_message, only: %i[update show destroy edit]
  def create
    # передаем в метод 2 именованных параметра
    #message = Message.create(
    #  body: params[:message][:body],
    #  user_id: params[:message][:user_id]
    #)
    # чтобы злоумышленник не мог изменить данные
    # permitted? - понимает, можно ли с этими параментрами
    # отправлять запрос в БД (защита от дурака)
    # приватный метод message_params
    message = Message.create(message_params)

    redirect_to message_path(message)
    #render text: "Ваш запрос обработан"
  end
  # обновление вопроса, который мы найдем по этому id
  def update
    #@message = Message.find(params[:id])
    @message.update(
      body: params[:message][:body],
      user_id: params[:message][:user_id]
    )

    redirect_to message_path(@message)
  end

  def destroy
    #@message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  def show
    # собака нужна, чтобы переменная была доступна в шаблоне
    #@message = Message.find(params[:id])
  end

  def index
    # множественное число! html each 
    @messages = Message.all
  end

  def new 
    # знает только структуру вопроса, пока еще не сохранена в базе
    @message = Message.new
  end

  def edit 
  end

  private 
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
