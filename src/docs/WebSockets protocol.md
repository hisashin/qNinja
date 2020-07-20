# WebSockets protocol
Inspired by [JSON-Pure](https://mmikowski.github.io/json-pure/) 

As we move to the real-time web we also need to move from RESTful APIs to a protocol suited to WebSockets.

## Action verbs

| Request    | Response                     | Confirmation         |
| ---------- | ---------------------------- | -------------------- |
| `retrieve` | `RETRIEVED or RETRIEVE_FAIL` | `abort, done, retry` |
| `create `  | `CREATE or CREATE_FAIL`      | `abort, done, retry` |
| `update `  | `UPDATE or UPDATE_FAIL`      | `abort, done, retry` |
| `crt_updt` | `CRT_UPTD or CRT_UPDT_FAIL`  | `abort, done, retry` |
| `delete`   | `DELETED or DELETE_FAIL`     | `abort, done, retry` |
| `patch`    | `PATCHED or PATCH_FAIL`      | `abort, done, retry` |
| `flush`    | `FLUSHED or FLUSH_FAIL`      | `abort, done, retry` |

The `create` verb -- equivalent to a POST method in a RESTful API is not idempotent.  If possible we suggest to create the resource ID at the point of origin -- typically on the client -- so that multiple messages or retries do not result in a resource duplication. You can use the `crt_upd` verb to create the resource if it doesn't exist or update if it doe/Users/valerio/Documents/_workarea/TheClothMask/how to keep your glasses clear while wearing a mask.mds abd ditch both `create` and `update`.

The `flush` verb which does not have an equivalent on the REST API was added so that the client can tell the server when it has removed data from its storage. Thus when the server distributes notification of changed records, it doesn’t have to send messages to clients that have flushed the containing record or data set.

## Message types
SPA APIs generally require four message types:

* Requests
* Direct responses
* Indirect responses
* Confirmations

### Requests
Requests are messages sent from clients requesting data manipulation or delivery. An example request to change a specific record would have the `crt_updt ` or `update` action verb.

### Direct responses
Direct responses are messages from the server to attached clients directly in response to a request. A direct response to the `crt_updt ` request in the example would use the `CRT_UPDTD ` action verb.

### Indirect responses
Indirect responses are sent from the server to clients without a direct corresponding request. This happens when the server needs to notify a client of a data change, such as an updated, deleted, or new record. An indirect response for the example above would have an `CRT_UPDTD ` action verb.

### Confirmations
Confirmations are sent from a client to a server to confirm a response has been received and processed. The client may indicate success with `done`, cancel the transaction with `abort`, or re-request the message with `retry`. Generally it is a good idea to avoid the complexities of supporting the idea of “partial success”.

## Standard message structure
API messages should have a standard, minimal structure that is consistent and easy to read.

### Message formats
Here is a template of JSON message formats for the request and response, phases of a transaction:

```
// request
{ trans_id   : "2c592003-1667-491f-8fd2-796acbae198b",
  service    : null,
  action     : "crt_updt",
  resource   : "experiment",
  parameters : {title : "Canonical PCR", 
  				   lid : 95, 
  					burnIn : {time : 60, temp : 95},
  					denature : {time : 20, temp : 95},
  					anneal : {time : 15, temp : 65},
  					...
  				  }
}
// response
{ trans_id  : "2c592003-1667-491f-8fd2-796acbae198b",
  action    : "CRT_UPTD",
  resource  : "experiment",
  response  : {code : 200, 
               message : "OK", 
               data :
                 {status : {[TBD]}, 
                  ...
                 }
              },
}
``` 

## Asynchronous transactions
We use `request-response-confirm` for API transactions instead of the REST `request-response` convention. To understand why let’s consider when `request-response` is more appropriate.

### request-response
We want the classic `request-response` approach when the web browser is used to display published content like a blog page. It is simple, clean, and well-understood. Any benefit of using a more complex transaction is almost certainly outweighed by the costs.

### request-response-confirm
SPAs, however, are better served by `request-response-confirm` transactions. For example, if a client requests a resource, the server issues a response. Once the client has received and processed the response, it will send a confirm to the server.

The benefits of the `request-response-confirm` transaction include:

* The confirmation goes beyond the transport status – was the message received? – and reports to the server the application status of the message – was the message properly processed and consumed? This is very important for an SPA so the server may keep track of client data sets.

* The transaction is asynchronous. The client, for example, may take 20 seconds to consume a large data set; or perhaps the client may wait for user approval before processing or denying a provided data set. During this time, the server can continue to process other request while awaiting the confirmation. Implementing such a delay over a typical RESTful `request-response` cycle can be difficult and expensive.

The `request-response-confirm` cycle is therefore often the best option if we need to sync records between a rich client and server.