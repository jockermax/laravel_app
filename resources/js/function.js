const userID = $('#user-data-information').attr("data-userID")
export function getData() {
    $('.form-submit').each( function () { 
        $(this).on('submit', function (e) {
            e.preventDefault();
        });
    });
    
}

export async function validateUserInformation() {
    const userID = $('#user-data-information').attr("data-userID")
    $('#btn-submit-personnal-informations').on('click', async function() {
       const data = {
        surname:$('#surname').val(),
        phone_number:$('#phone_number').val(),
        country:$('#country').val(),
        province:$('#province').val(),
        city_of_birth:$('#city_of_birth').val(),
        sex :$('#sex').val(),
        }
        console.log(data)
       return await submitData(`submit-user-information/${userID}`, data, 'PUT').then(response => console.log(response)).catch(error => console.error(error));
      
    })
}

export async function submitData(url, data, type) {
    try {
        const response = await  $.ajax(url, {
            type: type,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Content-Type':'application/json'
            },
            data: JSON.stringify(data),
        })
        return response
    } catch (error) {
        throw error
    } 
}

export async function submitFeedback(){
    $('#btn-submit-feedback').on('click', async function() {
    const userID = $('#user-data-information').attr("data-userID");
    const data = {
        feedback:$('#user-feedback').val(),
        create_at : new Date()
    }
    return await submitData(`submit-feedback/${userID}`, data, 'POST').then(response => console.log(response)).catch(error => console.error(error));
})
}

export async function submitDocument(){
    $('#user-documents').on('submit', async function(e){
        e.preventDefault();
        const userID = $('#user-data-information').attr("data-userID");
        let formData = new FormData();
        formData.append('last_diploma', $('#last_diploma')[0].files[0]);
        formData.append('passport_pdf_or_img', $('#passport_pdf_or_img')[0].files[0]);
        formData.append('two_last_bulletin', $('#two_last_bulletin')[0].files[0]);
        return await $.ajax(`upload-document/${userID}`, {
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log(response);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown);
            }
        });
    });
}


// triage des formations
const sortFormationList = (data) => {
    data.sort(function (a, b) {
        if (a.nom_formation === b.nom_formation) {
            return a.cycle.localeCompare(b.cycle);
        }
        return a.nom_formation.localeCompare(b.nom_formation);
    });
}

//affichage des formations proposees par l institut
export async function getFormationList(){
    try {
        const response = $.ajax(`get-list-formation/`,{
            type: 'GET',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Content-Type':'application/json'
            }
        })
        return response
    } catch (error) {
        throw error
    }
}

export async function appendFormation(data) {
    const formationList = data;
    const listLink = (accordionID, formationID, nom_formation, cycle, cout_formation) => {
        return $(`#${accordionID}`).append(`<a href="#" class="list-group-item list-group-item-action list-group-item-light formation-list-group" data-formationID="${formationID}" data-coutFormation="${cout_formation}">${cycle} ${nom_formation}</a>`)
    }
    const appendFormationListGroup = (data) => {
        const regexLicence = /licence/i;
        const regexMaster = /master/i;
        const regexIngenieur = /ingenieur/i;
        const regexDepartementGenieInformatique = /Genie-Informatique/i;
        const regexDepartementReseauxSystemes = /Reseaux & systemes/i;
        data.forEach(el => {
            console.log(el);
            if (regexLicence.test(el.cycle) && regexDepartementGenieInformatique.test(el.departement)) {
                listLink('accordion-Genie-Informatique-licence', el.id, el.nom_formation, el.cycle, el.cout_formation);
            } else if (regexLicence.test(el.cycle) && regexDepartementReseauxSystemes.test(el.departement)) {
                listLink('accordion-Reseaux-systemes-licence', el.id, el.nom_formation, el.cycle, el.cout_formation);
            } else if (regexMaster.test(el.cycle) && regexDepartementGenieInformatique.test(el.departement)) {
                listLink('accordion-Genie-Informatique-master', el.id, el.nom_formation, el.cycle, el.cout_formation);
            } else if (regexMaster.test(el.cycle) && regexDepartementReseauxSystemes.test(el.departement)) {
                listLink('accordion-Reseaux-systemes-master', el.id, el.nom_formation, el.cycle, el.cout_formation);
            } else if (regexIngenieur.test(el.cycle) && regexDepartementGenieInformatique.test(el.departement)) {
                listLink('accordion-Genie-Informatique-ingenieur', el.id, el.nom_formation, el.cycle, el.cout_formation);
            } else if (regexIngenieur.test(el.cycle) && regexDepartementReseauxSystemes.test(el.departement)) {
                listLink('accordion-Reseaux-systemes-ingenieur', el.id, el.nom_formation, el.cycle, el.cout_formation);
            }
        });
    }
    return appendFormationListGroup(formationList);
}
