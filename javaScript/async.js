
//const myPromise = new Promise((resolve, reject) => {
//	if (false) {				
//		setTimeout(() => {
//			resolve('I have succeeded');
//		}, 1000);
//	} else {
//		reject('I have failed');
//	}
//});
//
//myPromise.then(value => console.log(value))
//				 .catch(rejectValue => console.log(rejectValue));

const myPromise = new Promise((resolve, reject) => {
		setTimeout(() => {
			resolve('I have succeeded');
		}, 1000);
});

myPromise.then(value => console.log(value))

