import './bootstrap';
import { getData, validateUserInformation, submitFeedback, submitDocument, getFormationList, appendFormation, displaySelectedFormation } from './function';
(async function () {
    await getFormationList().then(async function (response) {
        await appendFormation(response);
        await displaySelectedFormation();
    }).catch(error => console.error(error));
})();
/*
getData();
validateUserInformation();
submitFeedback();
submitDocument(); */
