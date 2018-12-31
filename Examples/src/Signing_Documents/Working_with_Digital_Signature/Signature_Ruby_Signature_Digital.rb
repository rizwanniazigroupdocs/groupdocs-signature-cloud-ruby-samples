# Import module
from groupdocs_signature_cloud.rest import ApiException
from Common_Utilities.Utils import Common_Utilities
from groupdocs_signature_cloud.models.padding_data import PaddingData
from groupdocs_signature_cloud.models.pages_setup_data import PagesSetupData
from groupdocs_signature_cloud.models.pdf_sign_digital_options_data import PdfSignDigitalOptionsData
from groupdocs_signature_cloud.models.requests.post_digital_request import PostDigitalRequest

class Signature_Digital:

	@staticmethod
	def Post_Signature_Digital():

		try:
			# Getting instance of the API
			api = Common_Utilities.Get_SignatureApi_Instance();

			fileName = "sample2.pdf"
			password = ""
			folder = ""

			options = PdfSignDigitalOptionsData()

			# set digital signature properties
			options.image_guid = "signature.jpg"
			options.certificate_guid = "temp.pfx"
			options.password = "1234567890"
			# set position on page
			options.left = 100
			options.top = 100
			options.width = 100
			options.height = 100
			options.location_measure_type = "Pixels"
			options.size_measure_type = "Pixels"
			options.stretch = "None"
			options.rotation_angle = 45
			options.horizontal_alignment = "Left"
			options.vertical_alignment = "Top"
			# set margin
			margin = PaddingData(all = 100)		
			options.margin = margin
			options.margin_measure_type = "Pixels"
			#set border	
			options.border_dash_style = "DashLongDashDot"
			options.border_weight = 1
			options.opacity = 1
			options.border_visiblity = True
			#set pages for signing
			options.sign_all_pages = False
			options.document_page_number = 1
			pagesSetup = PagesSetupData(True, False, False, False)		
			options.pages_setup = pagesSetup		  

			request = PostDigitalRequest(fileName, options, password, folder, Common_Utilities.storage_name)
			
			api.post_digital(request)

			print("Document Signed");

		except ApiException as e:
			print("Exception when calling SignatureApi: {0}".format(e.message))