/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

/*
 * This example will create a Greengrass StreamManager stream called "SomeStream".
 * It will then start writing data into that stream and StreamManager will
 * automatically export the written data to a Kinesis Data Stream called "MyKinesisStream".
 * This example will run forever, until the program is killed.
 *
 * The size of the StreamManager stream on disk will not exceed the default (which is 256 MB).
 * Any data appended after the stream reaches the size limit, will continue to be appended, and
 * StreamManager will delete the oldest data until the total stream size is back under 256MB.
 * The Kinesis Data Stream in the cloud has no such bound, so all the data from this script
 * will be uploaded to Kinesis and you will be charged for that usage.
 */

const {
    StreamManagerClient, ReadMessagesOptions, ExportDefinition,
    KinesisConfig, MessageStreamDefinition, StrategyOnFull,
    ResourceNotFoundException,
} = require('aws-greengrass-stream-manager-sdk');

const STREAM_NAME = 'SomeStream';
const KINESIS_STREAM_NAME = 'MyKinesisStream';

const c = new StreamManagerClient();
c.onConnected(async () => {
    // Try deleting the stream (if it exists) so that we have a fresh start
    try {
        await c.deleteMessageStream(STREAM_NAME);
    } catch (e) {
        // Rethrow the error if it wasn't the expected error
        if (!(e instanceof ResourceNotFoundException)) {
            throw e;
        }
    }

    try {
        const exports = new ExportDefinition()
            .withKinesis([new KinesisConfig()
                .withIdentifier(`KinesisExport${STREAM_NAME}`)
                .withKinesisStreamName(KINESIS_STREAM_NAME)]);

        await c.createMessageStream(
            new MessageStreamDefinition()
                .withName(STREAM_NAME)
                .withStrategyOnFull(StrategyOnFull.OverwriteOldestData)
                .withExportDefinition(exports),
        );

        // Append 2 messages and print their sequence numbers
        console.log(`Successfully appended message to stream with sequence number ${await c.appendMessage(STREAM_NAME, Buffer.from('ABCDEFGHIJKLMNO', 'utf-8'))}`);
        console.log(`Successfully appended message to stream with sequence number ${await c.appendMessage(STREAM_NAME, Buffer.from('PQRSTUVWXYZ', 'utf-8'))}`);

        // Try reading the 2 messages we just appended and print them out
        console.log(`Successfully read 2 messages: ${
            await c.readMessages(STREAM_NAME,
                new ReadMessagesOptions()
                    .withMinMessageCount(2)
                    .withReadTimeoutMillis(1000))}`);

        console.log('Now going to start writing random integers between 0 and 255 to the stream');

        // Now start putting in random data between 0 and 255 to emulate device sensor input
        const interval = setInterval(async () => {
            try {
                console.log('Appending new random integer to stream');
                const buf = Buffer.alloc(1);
                buf.writeUInt8(Math.floor(Math.random() * 255), 0);
                await c.appendMessage(STREAM_NAME, buf);
            } catch {
                clearInterval(interval);
                c.close();
            }
        }, 1000);
    } catch {
        c.close();
    }
});

// Dummy handler because this example should run as a pinned lambda
module.exports.handler = function handler() {
    return '';
};
