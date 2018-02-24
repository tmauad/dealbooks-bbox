# frozen_string_literal: true

class ContactsController < ApplicationController
  def index; end

  def create
    ContactMailer.index(contact_params).deliver_now

    redirect_to contact_path, notice: 'Message sent successfully'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
