import TurnDown from "turndown"

export function turndownService() {
    let service = new TurnDown({
      headingStyle: "atx",
      bulletListMarker: "-",

    })

    service.addRule("headings", {
      filter: ['h1', 'h2', 'h3'],
      replacement: function(content, node, options) {
        return content
      }
    })

    service.remove(['form'])

    return service
}