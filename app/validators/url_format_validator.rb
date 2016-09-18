class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    protocol = options[:ssl_only] ? %w(https) : %w(http https)
    if value.present? && value !~ /\A#{URI::regexp(protocol)}\z/
        record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
    end
  end
end
