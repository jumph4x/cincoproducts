module Spree
  Image.class_eval do
    has_attached_file :attachment,
                      styles: { mini: '48x48>', small: '192x192>', product: '384x384>', large: '777x777>' },
                      default_style: :product,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  end
end
