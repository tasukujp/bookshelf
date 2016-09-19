class IsbnFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /[0-9\-]{9,16}[0-9X]/
      record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
    end
  end
end
