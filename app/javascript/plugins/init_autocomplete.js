import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('report_location');
  if (addressInput) {
    places({ container: addressInput });
  }

  // const searchInput = document.getElementById('query');
  // if (searchInput) {
  //   places({ container: searchInput });
  // }
};

export { initAutocomplete };
