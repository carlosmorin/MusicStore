
SimpleForm.setup do |config|
  # Wrappers configration
  config.wrappers :default, class: "form-group text-left mt-1" do |b|
    b.use :html5
    b.use :label
    b.use :input, class: "form-control", error_class: "is-invalid"
  end

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.error_notification_tag          = :div
  config.error_notification_class        = "invalid-feedback d-block"
  config.browser_validations             = false
  config.boolean_style                   = :nested
end