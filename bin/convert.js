var badJSON = '{ pg: { mappings: { publication: { properties: { abstractOriginal: { type: "string" }, affiliation: { type: "boolean" }, attachments: { properties: { attachment: { properties: { _content: { type: "string" }, _content_length: { type: "long" }, _content_type: { type: "string" }, _date: { type: "date", format: "strict_date_optional_time||epoch_millis" }, _name: { type: "string" } } }, id: { type: "string" }, licenseSymbol: { type: "string" }, originalId: { type: "string" }, originalName: { type: "string" }, ownerType: { type: "string" }, systemId: { type: "string" } } }, bibliographyPosCount: { type: "long" }, diagramCount: { type: "long" }, id: { type: "string" }, keyWords: { type: "string", fields: { sort: { type: "string", analyzer: "ducet_sort" } } }, language: { properties: { id: { type: "string" }, value: { type: "string" } } }, originalId: { type: "string" }, photoCount: { type: "long" }, pictureCount: { type: "long" }, preprint: { type: "boolean" }, sendDate: { type: "date", format: "strict_date_optional_time||epoch_millis" }, systemId: { type: "string" }, tableCount: { type: "long" }, titleOriginal: { type: "string", fields: { sort: { type: "string", analyzer: "ducet_sort" } } } } } } } }';
var obj = eval( '(' + badJSON + ')' );
console.log( obj );    // Logs: Object {a: "b"}
var jsonData = JSON.stringify(obj);

var fs = require('fs');
fs.writeFile("/tmp/test", jsonData, function(err) {
    if(err) {
        return console.log(err);
    }

    console.log("The file was saved!");
}); 
