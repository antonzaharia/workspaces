// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import './controllers'
import 'flowbite'

// Not sure if this is good or not for Turbo but it fixes the dropdown after redirect
import { Turbo } from '@hotwired/turbo-rails'
Turbo.session.drive = false