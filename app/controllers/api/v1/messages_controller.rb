# frozen_string_literal: true

module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_message, only: %i[show update destroy]

      def index
        @messages = Message.all
        authorize @messages

        render json: @messages
      end

      def show
        authorize @message

        render json: @message
      end

      def create
        @message = Message.new(message_params)
        @message.user = current_user

        authorize @message

        if @message.save
          render json: @message, status: :created, location: api_v1_message_url(@message)
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end

      def update
        authorize @message

        if @message.update(message_params)
          render json: @message
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize @message

        @message.destroy
      end

      private

      def set_message
        @message = Message.find(params[:id])
      end

      def message_params
        params.require(:message).permit(:content)
      end
    end
  end
end
