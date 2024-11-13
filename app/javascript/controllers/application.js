import { Application, defaultSchema } from "@hotwired/stimulus"

const customSchema = {
  ...defaultSchema,
  keyMappings: { ...defaultSchema.keyMappings, backspace: "@" },
}

const application = Application.start(document.documentElement, customSchema);
export {application};