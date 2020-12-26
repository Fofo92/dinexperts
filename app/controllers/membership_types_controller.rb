class MembershipTypesController < ApplicationController
#  before_action :set_membership_type, only: [:show, :edit, :update, :destroy]

  def index
    @membership_types = MembershipType.all
  end
end
