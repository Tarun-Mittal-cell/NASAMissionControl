const mongoose = require('mongoose');

const MONGO_URL = 'mongodb+srv://nasa-api:VPa8CB9Csjldz4Qy@nasacluster.u24ekq3.mongodb.net/nasa?retryWrites=true&w=majority';


mongoose.connection.once('open', () => {
    console.log('MongoDB connection ready!');
});


mongoose.connection.on('error', (err) => {
    console.log(err);
});


async function mongoConnect() {
    await mongoose.connect(MONGO_URL, {
        useNewUrlParser: true,
        useFindAndModify: false,
        useCreateIndex: true, 
        useUnifiedTopology: true,
    });
}