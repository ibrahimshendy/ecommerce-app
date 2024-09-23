# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    def self.when(passes, lambda_filter)
      unless passes
        return self
      end

      lambda_filter.()
    end

    def self.filter(params)
      limit = params[:limit].present? ? params[:limit].to_i : Rails.application.config_for(:default)[:pagination][:limit]

      self.when(params[:id].present?, -> { self.where(id: params[:id].to_i) })
          .when(params[:sort].present?, -> { self.order(sort: params[:sort].to_s.downcase) })
          .limit(limit)
          .offset((params[:page].to_i > 0 ? params[:page].to_i - 1 : 0) * limit)
    end

  end
end
