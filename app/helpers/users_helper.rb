module UsersHelper
  
  def get_titles
    # Return i18n strings for titles
    return [
      I18n.t('activerecord.attributes.user.titles.mr'),
      I18n.t('activerecord.attributes.user.titles.mrs'),
      I18n.t('activerecord.attributes.user.titles.ms'),
      I18n.t('activerecord.attributes.user.titles.miss'),
      I18n.t('activerecord.attributes.user.titles.dr'),
      I18n.t('activerecord.attributes.user.titles.prof')
    ]
  end
end
