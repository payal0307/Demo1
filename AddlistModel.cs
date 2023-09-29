using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OLXPROJECT.Models
{
    public class MyAdvertiseModel
    {
        public int advertiseId { get; set; }
        public int productSubCategoryId { get; set; }
        public string advertiseTitle { get; set; }
        public string advertiseDescription { get; set; }
        public string advertisePrice { get; set; }
        public int areaId { get; set; }
        public string advertiseStatus { get; set; }
        public int userId { get; set; }
        public string advertiseapproved { get; set; }

    }

    public class AddlistModel
    {
        public int productDetailsId { get; set; }
        public int productSubCategoryId { get; set; }
        public string productTitle { get; set; }
        public string productDescription { get; set; }
        public string productPrice { get; set; }
        public int productImageId { get; set; }
        public int cityId { get; set; }
        public string productStatus { get; set; }
        public int userId { get; set; }

    }
    public class ProductSubCategoryModel
    {
        public int productSubCategoryId { get; set; }
        public string productCategoryId { get; set; }
        public string productSubCategoryName { get; set; }
    }
        public class AdvertiseImagesModel
    { 
        public int advertiseImageId { get; set; }
        public int advertiseId { get; set; }
        public string imageData { get; set; }
    }
    public class StateModel
    {
        public int stateId { get; set; }
        public string stateName { get; set; }
    }
    public class CityModel
    {
        public int cityId { get; set; }
        public int stateId { get; set; }
        public string cityName { get; set; }

    }
    public class AreaModel
    {
        public int areaId { get; set; }
        public int cityId { get; set; }
        public string areaName { get; set; }
    }
    public class RegistrationModel
    {

        public int userId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string userEmail { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public string City { get; set; }

    }
}