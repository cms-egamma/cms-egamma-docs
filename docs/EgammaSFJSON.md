<!---
-->
# Scale factors from JSONs

The following is the guide to use EGamma JSON's for getting electron/photon scale factors in your analysis:

## First Step: Get the correctionlib library

    python3 -m pip install git+https://github.com/cms-nanoAOD/correctionlib.git

## Second Step: Get the EGamma JSONs

You can either get them from [the central POG
repository](https://gitlab.cern.ch/cms-nanoAOD/jsonpog-integration/-/tree/master/POG/EGM)
or get them from CVMFS:
/cvmfs/cms.cern.ch/rsync/cms-nanoAOD/jsonpog-integration (recommended).
The cvmfs files are synced once a day.

## Electron JSON

This JSON has 1 format

###### Electron JSON Format:

evaluator\[<span class="twiki-macro GREEN"></span> JSON Map Name
%ENDCOLOR%\].evaluate(<span class="twiki-macro GREEN"></span> year
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Value Type
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Working Point
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
eta <span class="twiki-macro ENDCOLOR"></span>,
<span class="twiki-macro GREEN"></span> pt
<span class="twiki-macro ENDCOLOR"></span>)

Format Guide:

|               |                                                                                                  |                                                                                         |                                                                                               |                                                                                                                |                                                                                        |                                                                                       |
| ------------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| JSON to use   | <span class="twiki-macro GREEN"></span> JSON Map Name <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> year <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Value Type <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Working Point <span class="twiki-macro ENDCOLOR"></span>               | <span class="twiki-macro GREEN"></span> eta <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> pt <span class="twiki-macro ENDCOLOR"></span> |
| electron.json | "UL-Electron-ID-SF"                                                                              | "2016preVFP", "2016postVFP", "2017","2018"                                              | "sf", "sfup","sfdown"                                                                         | "RecoBelow20","RecoAbove20","Veto", "Loose", "Medium", "Tight", "wp80iso", "wp80noiso", "wp90iso", "wp90noiso" | float value                                                                            | float value                                                                           |

###### Python Example for electron JSON:

Python Example to print a scale factor value

    from correctionlib import _core
    
    #Download the correct JSON files 
    evaluator = _core.CorrectionSet.from_file('electron.json')
    
    #Reconstruction (pT< 20 GeV) Run-2 scale factor
    valsf= evaluator["UL-Electron-ID-SF"].evaluate("2016postVFP","sf","RecoBelow20",1.1, 15.0)
    print("sf is:"+str(valsf))
    
    #Reconstruction (pT> 20 GeV) Run-2 scale factor
    valsf= evaluator["UL-Electron-ID-SF"].evaluate("2016postVFP","sf","RecoAbove20",1.1, 25.0)
    print("sf is:"+str(valsf))

## Photon JSON

This JSON has 2 formats

###### Photon JSON Format 1 for ID SFs:

evaluator\[<span class="twiki-macro GREEN"></span> JSON Map Name
%ENDCOLOR%\].evaluate(<span class="twiki-macro GREEN"></span> year
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Value Type
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Working Point
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
eta <span class="twiki-macro ENDCOLOR"></span>,
<span class="twiki-macro GREEN"></span> pt
<span class="twiki-macro ENDCOLOR"></span>)

Format Guide:

|             |                                                                                                  |                                                                                         |                                                                                               |                                                                                                  |                                                                                        |                                                                                       |
| ----------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| JSON to use | <span class="twiki-macro GREEN"></span> JSON Map Name <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> year <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Value Type <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Working Point <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> eta <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> pt <span class="twiki-macro ENDCOLOR"></span> |
| photon.json | "UL-Photon-ID-SF"                                                                                | "2016preVFP", "2016postVFP", "2017","2018"                                              | "sf", "sfup","sfdown"                                                                         | "Loose", "Medium", "Tight", "wp80", "wp90"                                                       | float value                                                                            | float value                                                                           |

###### Photon JSON Format 2 for CSEV AND Pix veto SFs:

evaluator\[<span class="twiki-macro GREEN"></span> JSON Map Name
%ENDCOLOR%\].evaluate(<span class="twiki-macro GREEN"></span> year
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Value Type
<span class="twiki-macro ENDCOLOR"></span>,<span class="twiki-macro GREEN"></span>
Working Point <span class="twiki-macro ENDCOLOR"></span>,
<span class="twiki-macro GREEN"></span> Bin
<span class="twiki-macro ENDCOLOR"></span>)

Format Guide:

|             |                                                                                                  |                                                                                         |                                                                                               |                                                                                                  |                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| JSON to use | <span class="twiki-macro GREEN"></span> JSON Map Name <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> year <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Value Type <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Working Point <span class="twiki-macro ENDCOLOR"></span> | <span class="twiki-macro GREEN"></span> Bin <span class="twiki-macro ENDCOLOR"></span> |
| photon.json | "UL-Photon-PixVeto-SF", "UL-Photon-CSEV-SF"                                                      | "2016preVFP", "2016postVFP", "2017","2018"                                              | "sf", "sfup","sfdown"                                                                         | "Loose", "Medium", "Tight", "MVA"                                                                | "EBInc","EBHighR9", "EBLowR9", "EEInc", "EEHighR9", "EELowR9"                          |

##### Python Example for photon JSON:

Python Example to print a scale factor value for JSON Format 1

    from correctionlib import _core
    
    #Download the correct JSON files 
    from evaluator = _core.CorrectionSet.from_file('photon.json')
    
    valsyst= evaluator["UL-Photon-ID-SF"].evaluate("2016postVFP","sfup","Medium",1.1, 34.0)
    print("sfup is:"+str(valsyst))

Python Example to print a scale factor value for JSON Format 2

    from correctionlib import _core
    
    #Download the correct JSON files 
    from evaluator = _core.CorrectionSet.from_file('photon.json')
    
    valsf= evaluator["UL-Photon-CSEV-SF"].evaluate("2016postVFP","sf","Loose","EBInc")
    print("sf is:"+str(valsf))

##### Link To development repo: <https://github.com/cms-egamma/ScaleFactorsJSON>

##### The merging with common CMS repo can be monitored here:

<https://gitlab.cern.ch/cms-nanoAOD/jsonpog-integration/-/merge_requests/37>
