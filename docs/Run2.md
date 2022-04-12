<!---
-->
# Releases

As far as we are aware, there is no dependence on the release used to
analyse the data, only the release and conditions used to reconstruct
that data. Running VID and scale & smearing counts as analysis here. As
an example the 2016 legacy scale factors are valid for working in 80X,
94X and 102X releases. Further more, the reminiAODs do not alter the
quantities of e/gamma objects, they only add additional information.
Therefore there is no difference between running VID yourself on V1
MiniAOD or reading it directly in V2 miniAOD. So rest assured, the scale
factors for a given data (2018, 2017, 2016 Legacy) are the same no
matter what you do. Feel free to ask us for further clarification on
<hn-cms-egamma@cern.ch>.

# E/gamma DataFormat

We have now use the E/gamma MiniAODV2 format which embeds all the energy
corrections and the IDs inside the pat::Electron/pat::Photon. Please see
[EgammaMiniAODV2](EgammaMiniAODV2) for more information. We provide
tools to update the format with new IDs and energy corrections, please
see [EgammaPostRecoRecipes](EgammaPostRecoRecipes). This is probably the
easier way to use E/gamma objects.

# E/gamma Trigger

## L1 Prefiring

The darkening of the ECAL crystals causes the light reaching the
photodetectors to become increasingly delayed. Due to the interaction of
this effect with the trigger electronics, it is possible for a trigger
tower to be assigned to the previous bunch crossing, with the likelihood
of this happening increasing with increasing opacity of the crystal.
This effect is was not corrected for and in **2016 and 2017**, it is
possible for L1 ECAL trigger primatives corresponding to an object to
end up in the previous bunch crossing. As there is unlikely to be
anything in this event cababile of passing the HLT, the event is
rejected. Even worse, due to CMS trigger rules, the L1 can not fire on
two successive bunch crossings so even if there are other objects to
trigger on at L1 in the correct bunch crossing, the event is rejected.
This manifests itself as an event level trigger inefficiency and is not
included in tag\&probe measurements.

There exists a preliminary recipe by Laurent Thomas and rest of the
pre-firing team:
[L1ECALPrefiringWeightRecipe](%SCRIPTURL{"view"}%auth/CMS/L1ECALPrefiringWeightRecipe).

Please be aware that the recipe is only guaranteed to work when there is
only one prefirable object (ie |η|\>2.0). The recipe may work with \>=1
prefirable objects but this is strongly topology dependent. In this case
you should definately check with the experts, do not blindly assume it
works for this case.

As this recipe is still preliminary, we & the l1 pre-firing group would
greatly appreciate feedback.

## Selecting a Trigger Path

The twiki [EgHLTRunIISummary](EgHLTRunIISummary) gives a complete
listing of all E/gamma triggers (including cross triggers) for 2016,
2017 and 2018. It also gives some basic suggestions for the typical uses
cases for electrons. The detailed selection of each trigger is
summarised in [EgHLTPathDetails](EgHLTPathDetails) (its a large twiki,
can take a while to load).

## HLT Z<sub>vtx</sub> Scale Factor

  - there is an allowed Z region for an electron to be in the HLT which
    is obtained by the online beamspot. There were problems in the
    begining of 2017, which means that the z region was too small and
    efficiency suffered. This can not be determined with Z-\>ee tag &
    probe as the tag & probe have the same zvtx. Care must be taken with
    e-mu tag and probe as this will include it as the muon triggers were
    not as effected
      - for more details, please see [this talk from the 07/02/18 EGM
        Meeting](https://indico.cern.ch/event/697573/contributions/2887077/attachments/1596611/2530584/hltZVtxInefficiency.pdf)
  - the MC efficiency is one so the efficiency of the online Z region
    cut in the HLT and the scale factor for MC are identical
  - events selected using electron triggers which use pixel matching
    require an additional scale factor. As it is event level, it should
    be applied only once per event, no matter how many electrons were
    required to be triggered
  - this only needs to be applied in 2017, 2016 & 2018 are fine
  - these numbers are considered final by E/gamma (and are unchanged
    since last year)
      - the 2018 number measured to be \> 0.99976 and is taken to be 1.0
        as a 0.02% inefficiency dwarfed by other efficiency systematics

| **Era** | 2016 | 2017B | 2017C | 2017DEF | 2017BCDEF | 2018 | | **SF**
| 1.0±0.0 | 0.934±0.005 | 0.992±0.001 | 1.000 | 0.991±0.001 | 1.0±0.0 |

# E/gamma RECO

## Photon Scale Factors

The scale factor to reconstruct a supercluster with H/E\<0.5 is assumed
to be 100%

## Electron Scale Factors

This is the scale factor to get a GsfTrack once you have a supercluster
with H/E\<0.5.

  - [2016 prompt
    .root](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/RECO/passingRECO/egammaEffi.txt_EGM2D.root)
      - here they are flat vs pt
      - below GeV and above \>80 GeV the systematic is increased by 1%
  - [2016 legacy, E<sub>T</sub> \< 20 GeV
    .root](%PUBURL%/CMS/EgammaIDRecipesRun2/EGM2D_BtoH_low_RecoSF_Legacy2016.root)
  - [2016 legacy, E<sub>T</sub> \> 20 GeV
    .root](%PUBURL%/CMS/EgammaIDRecipesRun2/EGM2D_BtoH_GT20GeV_RecoSF_Legacy2016.root)
      - <https://indico.cern.ch/event/662761/contributions/2993714/attachments/1644305/2627487/0504_RECOSFs.pdf>
      - <https://indico.cern.ch/event/697080/contributions/2986493/attachments/1641173/2621057/0427_RECOSFs.pdf>

<!-- end list -->

  - [2017, E<sub>T</sub> \< 20 GeV
    .root](%PUBURL%/CMS/Egamma2017DataRecommendations/egammaEffi.txt_EGM2D_runBCDEF_passingRECO_lowEt.root)
  - [2017, E<sub>T</sub> \> 20 GeV
    .root](%PUBURL%/CMS/Egamma2017DataRecommendations/egammaEffi.txt_EGM2D_runBCDEF_passingRECO.root)
      - Link to the presentation for 2017 Rereco SFs:
        <https://indico.cern.ch/event/695160/contributions/2893558/attachments/1598949/2534169/0212_RECOSFs_update.pdf>
      - <https://indico.cern.ch/event/697573/contributions/2887072/attachments/1596519/2529058/0207_RECOSFs.pdf>

<!-- end list -->

  - [2018
    .root](%PUBURL%/CMS/EgammaIDRecipesRun2/egammaEffi.txt_EGM2D_updatedAll.root)
      - note this has been slightly updated w.r.t to the old scale
        factor split into two bins, however the numbers are compatible
        with each other and no major change expected. Link to the
        presentation:
        <https://indico.cern.ch/event/794628/contributions/3303043/attachments/1791305/2923400/RECOSFs_0208_update.pdf>

# E/gamma IDs

E/gamma maintains several IDs, both cut based and MVA. In terms of cut
based, there is also the HEEP (high energy) ID which aimed to be a
simple straighforward ID that is safe for high energy electrons. The
HEEP ID for historical reasons operates on a different versioning than
other cut based IDs. All these IDs are accessible as part of the
pat::Electron/pat::Photon however depending on the miniAOD version you
run over, you may need to run EgammaPostReco tools to embed it first. It
is important to note due to the way our ID framework functions, if you
find an ID in the pat::Electron/pat::Photon with the requested name,
that ID will be the correct. So if you find the ID you are looking for,
you should not worry that its an out of date version.

More information can be found at
[EgammaIDRecipesRun2](EgammaIDRecipesRun2)

## Example accessing IDs

We recommend using the E/gamma miniAOD V2 format which embeds all the
IDs in the pat::Electron,pat::Photon which means if you know the name of
the ID, you can access it straightforwardly like:

    pat::Electron::electronID("cutBasedElectronID-Fall17-94X-V1-tight")==true //passes Fall17 V1 tight
    pat::Photon::photonID("cutBasedPhotonID-Fall17-94X-V1-tight")==true //passes Fall17 V1 tight 

We try to have our IDs in a release so no PR is necessary. However for
the latest and greatest ID, there will be a period of time where the ID
has to be merged in via a PR. For each ID, the first CMSSW release where
the ID is included is indidicated as "release availiblity". The miniAOD
which has this ID embedded is also noted as "miniAOD availiblity".

## Electrons IDs:

### Spring16 (mva) & Summer16 (cut based)

  - summary: tunned on 80X spring16/summer16 MC and prompt data
  - release availiblity: CMSSW\_9\_4\_0, CMSSW\_10\_2\_0
  - miniAOD availiblity: 2016 v3 miniAOD, 2017 v2 miniAOD, 2018 v1
    miniAOD
  - recommended for: 2016 (prompt and legacy)
  - scale factors 2016 prompt:
      - [cutBasedElectronID-Summer16-80X-V1-veto](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingVeto80X/egammaEffi.txt_EGM2D.root)
      - [cutBasedElectronID-Summer16-80X-V1-loose](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingLoose80X/egammaEffi.txt_EGM2D.root)
      - [cutBasedElectronID-Summer16-80X-V1-medium](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingMedium80X/egammaEffi.txt_EGM2D.root)
      - [cutBasedElectronID-Summer16-80X-V1-tight](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingTight80X/egammaEffi.txt_EGM2D.root)
      - [mvaEleID-Spring16-GeneralPurpose-V1-wp80](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingMVA80Xwp80/egammaEffi.txt_EGM2D.root)
      - [mvaEleID-Spring16-GeneralPurpose-V1-wp90](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/EleID/passingMVA80Xwp90/egammaEffi.txt_EGM2D.root)
  - scale factors 2016 legacy:
      - [cutBasedElectronID-Summer16-80X-V1-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronLoose.root)
      - [cutBasedElectronID-Summer16-80X-V1-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMedium.root)
      - [cutBasedElectronID-Summer16-80X-V1-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronTight.root)
      - [mvaEleID-Spring16-GeneralPurpose-V1-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVAwp80.root)
      - [mvaEleID-Spring16-GeneralPurpose-V1-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVAwp90.root)

### Fall17v1

  - summary: ID was tuned on 92X MC, 2017 data and was made availible
    for Moriond2018 Analyises
  - release availiblity: CMSSW\_9\_4\_9, CMSSW\_10\_2\_0
  - miniAOD availiblity: 2016 v3 miniAOD, 2017 v2 miniAOD, 2018 v1
    miniAOD
  - recommended for: 2017
      - note we would suggest you use the Fall17v2 IDs as they give
        better signal vs background seperation but its fine to use these
        for 2017 if you prefer. You could also use them for 2018 but we
        would really prefer you use the Fall17v2. We do not plan to
        provide scale factors for these IDs for 2018 though so if you do
        have a good reason to use them, come talk to us.
  - scale factors 2017:
      - [cutBasedElectronID-Fall17-94X-V1-loose](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/egammaEffi.txt_EGM2D_runBCDEF_passingLoose94X.root)
      - [cutBasedElectronID-Fall17-94X-V1-medium](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/egammaEffi.txt_EGM2D_runBCDEF_passingMedium94X.root)
      - [cutBasedElectronID-Fall17-94X-V1-tight](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/egammaEffi.txt_EGM2D_runBCDEF_passingTight94X.root)
      - [cutBasedElectronID-Fall17-94X-V1-veto](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/egammaEffi.txt_EGM2D_runBCDEF_passingVeto94X.root)
      - [mvaEleID-Fall17-iso-V1-wp80](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/gammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp80iso.root)
      - [mvaEleID-Fall17-noIso-V1-wp80](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/gammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp80noiso.root)
      - [mvaEleID-Fall17-iso-V1-wp90](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/gammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp90iso.root)
      - [mvaEleID-Fall17-noIso-V1-wp90](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Electrons/gammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp90noiso.root)

### Fall17v2

  - summary: ID was tuned on 94X MC, 2017 data and offers improvements
    on the Fall17v1 IDs
  - release availiblity: CMSSW\_10\_2\_0
      - PRs: cms-egamma:EgammaID\_949 (for 94X \>= 949)
  - miniAOD availiblity: 2018 v1 miniAOD
  - recommended for: 2016, 2017, 2018
      - we consider these the best possible IDs right now with the best
        signal
      - can use for 2016 if you want to use a consistent ID for all
        years
  - scale factors 2016 (legacy):
      - [cutBasedElectronID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronLoose_Fall17V2.root)
      - [cutBasedElectronID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMedium_Fall17V2.root)
      - [cutBasedElectronID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronTight_Fall17V2.root)
      - [mvaEleID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVA80_Fall17V2.root)
      - [mvaEleID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVA90_Fall17V2.root)
      - [mvaEleID-Fall17-noIso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVA80noiso_Fall17V2.root)
      - [mvaEleID-Fall17-noIso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_ElectronMVA90noiso_Fall17V2.root)
  - scale factors 2017:
      - [cutBasedElectronID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronLoose.root)
      - [cutBasedElectronID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronMedium.root)
      - [cutBasedElectronID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronTight.root)
      - [mvaEleID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronMVA80.root)
      - [mvaEleID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronMVA90.root)
      - [mvaEleID-Fall17-noIso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronMVA80noiso.root)
      - [mvaEleID-Fall17-noIso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_ElectronMVA90noiso.root)
  - scales factors 2018:
      - [cutBasedElectronID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronLoose.root)
      - [cutBasedElectronID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronMedium.root)
      - [cutBasedElectronID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronTight.root)
      - [mvaEleID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronMVA80.root)
      - [mvaEleID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronMVA90.root)
      - [mvaEleID-Fall17-noIso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronMVA80noiso.root)
      - [mvaEleID-Fall17-noIso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_ElectronMVA90noiso.root)

### HEEPV7.0

  - summary: a simple robust ID designed to be safe for high electrons.
    The Et evolution of this ID must be well described in the MC
    therefore this ID is designed so its scale factor is flat vs Et. As
    a result the HEEP differs in that it provides just a single number
    for the barrel and a single number for the endcap.
  - release availibity: CMSSW\_9\_4\_0, CMSSW\_10\_2\_0
  - miniAOD availiblity: 2016 v3 miniAOD, 2017 v2 miniAOD, 2018 v1
    miniAOD
  - recommended for: 2016 (prompt and legacy), 2017
  - scale factors:
      - 2016 prompt: 0.971±0.001 (stat) (EB), 0.983±0.001 (stat) (EE)
          - uncertainty: EB E<sub>T</sub> \< 90 GeV: 1% else
            min(1+(E<sub>T</sub>-90)\*0.0022)%,3%)
          - uncertainty: EE E<sub>T</sub> \< 90 GeV: 1% else
            min(1+(E<sub>T</sub>-90)\*0.0143)%,4%)
      - 2016 legacy: take from slide 10 of
        <https://indico.cern.ch/event/831669/contributions/3485543/attachments/1871797/3084930/ApprovalSlides_EE_v3.pdf>
      - 2017 prompt: 0.967±0.001 (stat) (EB), 0.973±0.002 (stat) (EE)
          - uncertainty: EB E<sub>T</sub> \< 90 GeV: 1% else
            min(1+(E<sub>T</sub>-90)\*0.0022)%,3%)
          - uncertainty: EE E<sub>T</sub> \< 90 GeV: 2% else
            min(1+(E<sub>T</sub>-90)\*0.0143)%,5%)

### HEEPv7.0-2018Prompt

There was a retune of HEEPv7.0 ID for 2018 due to HCAL data/MC
disagreements. The cuts in EB remain same as HEEPv7.0, but there were
some changes in cuts in EE. The H/E cut and EM+Had\_depth1 isolation cut
changed in 2018 for EE only.

For more details, see

1\) Decicated study by W. Fang etc al.
<https://indico.cern.ch/event/787315/contributions/3434898/attachments/1847223/3031172/HEEP_2019_0517_v3.pdf>
. In slide 16, the choice 2 was considered the final choice, and was
used in Z'-\>EE search.

2\) Z'-\>EE approval talk
<https://indico.cern.ch/event/831669/contributions/3485543/attachments/1871797/3084930/ApprovalSlides_EE_v3.pdf>

This ID is not centrally available in
<https://github.com/cms-sw/cmssw/tree/CMSSW_10_2_X/RecoEgamma/ElectronIdentification/python/Identification>
, which means that users need to manually apply this ID. Users can make
use of individual cuts as described here
[https://twiki.cern.ch/twiki/bin/view/CMS/CutBasedElectronIdentificationRun2\#Applying\_Individual\_Cuts\_of\_a\_Se](CutBasedElectronIdentificationRun2#Applying_Individual_Cuts_of_a_Se)
, so that the other cuts that did not change in 2018 can still be used
from centrally available VID.

  - For 2018 rereco (Autumn 18) the SF are the following, 0.969 +/-
    0.000 (stat) (EB), and 0.984 +/- 0.001 (stat) (EE). The systematic
    uncertainty is same as 2017 prompt, as indicated in slide 15 of
    Z'-\>EE approval presentation, linked above. So, the following
    should be used
  - uncertainty: EB E\<sub style="background-color:
    transparent;"\>T</sub> \< 90 GeV: 1% else min(1+(E\<sub
    style="background-color: transparent;"\>T</sub>-90)\*0.0022)%,3%)
  - uncertainty: EE E\<sub style="background-color:
    transparent;"\>T</sub> \< 90 GeV: 2% else min(1+(E\<sub
    style="background-color: transparent;"\>T</sub>-90)\*0.0143)%,5%)
  - For more details see here
    [https://twiki.cern.ch/twiki/bin/view/CMS/HEEPElectronIdentificationRun2\#Scale\_Factor](HEEPElectronIdentificationRun2#Scale_Factor).
    As always, HEEP ID SF are just two numbers, one for EB and one for
    EE.

## Photon IDs:

If you are using any of our photon IDs for high pT (\>200 GeV) photons,
then read this twiki for detailed EGM recommendations:
[https://twiki.cern.ch/twiki/bin/view/CMS/EGMPhotonIDHighPtPhotons](EGMPhotonIDHighPtPhotons)

### Spring16

  - summary: tunned on 80X spring16 MC and prompt data
  - release availiblity: CMSSW\_9\_4\_0, CMSSW\_10\_2\_0
  - miniAOD availiblity: 2016 v3 miniAOD, 2017 v2 miniAOD, 2018 v1
    miniAOD
  - recommended for: 2016 (prompt and legacy)
  - scale factors 2016 prompt:
      - [cutBasedPhotonID-Spring16-V2p2-loose](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/PhoID/Loose80X/egammaEffi.txt_EGM2D.root)
      - [cutBasedPhotonID-Spring16-V2p2-medium](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/PhoID/Medium80X/egammaEffi.txt_EGM2D.root)
      - [cutBasedPhotonID-Spring16-V2p2-tight](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/PhoID/Tight80X/egammaEffi.txt_EGM2D.root)
      - [mvaPhoID-Spring16-nonTrig-V1-wp90](http://fcouderc.web.cern.ch/fcouderc/EGamma/scaleFactors/Moriond17/approval/PhoID/MVA80Xwp90/egammaEffi.txt_EGM2D.root)

<!-- end list -->

  - scale factors 2016 legacy:
      - [cutBasedPhotonID-Spring16-V2p2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_PhotonCutBasedLoose.root)
      - [cutBasedPhotonID-Spring16-V2p2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_PhotonCutBasedMedium.root)
      - [cutBasedPhotonID-Spring16-V2p2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_PhotonCutBasedTight.root)
      - [mvaPhoID-Spring16-nonTrig-V1-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_PhotonMVAWP80.root)
      - [mvaPhoID-Spring16-nonTrig-V1-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2016LegacyReReco_PhotonMVAWP90.root)

### Fall17v1

  - summary: ID was tuned on 92X MC, 2017 data and was made availible
    for Moriond2018 Analyises
  - release availiblity: CMSSW\_9\_4\_9, CMSSW\_10\_2\_0
  - miniAOD availiblity: 2016 v3 miniAOD, 2017 v2 miniAOD, 2018 v1
    miniAOD
  - recommended for: 2017
      - note we would suggest you use the Fall17v2 IDs as they give
        better signal vs background seperation but its fine to use these
        for 2017 if you prefer. You could also use them for 2018 but we
        would really prefer you use the Fall17v2. We do not plan to
        provide scale factors for these IDs for 2018 though so if you do
        have a good reason to use them, come talk to us.
  - scale factors 2017:
      - [cutBasedPhotonID-Fall17-94X-V1-loose](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Photons/egammaEffi.txt_EGM2D_runBCDEF_passingLoose94X.root)
      - [cutBasedPhotonID-Fall17-94X-V1-medium](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Photons/egammaEffi.txt_EGM2D_runBCDEF_passingMedium94X.root)
      - [cutBasedPhotonID-Fall17-94X-V1-tight](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Photons/egammaEffi.txt_EGM2D_runBCDEF_passingTight94X.root)
      - [mvaPhoID-RunIIFall17-v1p1-wp80](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Photons/egammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp80.root)
      - [mvaPhoID-RunIIFall17-v1p1-wp90](https://soffi.web.cern.ch/soffi/EGM-ID/SF-17Nov2017-MCv2-IDv1-020618/Photons/egammaEffi.txt_EGM2D_runBCDEF_passingMVA94Xwp90.root)

### Fall17v2

  - summary: ID was tuned on 94X MC, 2017 data and offers improvements
    on the Fall17v1 IDs
  - release availiblity: CMSSW\_10\_2\_10 (which is not out yet)
  - miniAOD availiblity: none
      - PRs: cms-egamma:EgammaID\_949 (for 94X \>= 949)
          - currently RECO has decided not to allow backport to the
            official CMSSW [due to release stability
            concerns](https://github.com/cms-sw/cmssw/pull/25408)
      - PRs: cms-egamma:EgammaID\_1023 (for 102X \>= 1023)
          - currently merged in CMSSW\_10\_2\_X and should be in
            CMSSW\_10\_2\_10 when availible
  - recommended for: 2016, 2017, 2018
      - we consider these the best possible IDs right now with the best
        signal
      - its a bit marginal gains for 2016 over the 2016 ID so we mainly
        recommend it out of consistency
  - scale factors 2016:
      - [cutBasedPhotonID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/Fall17V2_2016_Loose_photons.root)
      - [cutBasedPhotonID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/Fall17V2_2016_Medium_photons.root)
      - [cutBasedPhotonID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/Fall17V2_2016_Tight_photons.root)
      - [mvaPhoID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/Fall17V2_2016_MVAwp80_photons.root)
      - [mvaPhoID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/Fall17V2_2016_MVAwp90_photons.root)
  - scale factors 2017:
      - [cutBasedPhotonID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_PhotonsLoose.root)
      - [cutBasedPhotonID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_PhotonsMedium.root)
      - [cutBasedPhotonID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_PhotonsTight.root)
      - [mvaPhoID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_PhotonsMVAwp80.root)
      - [mvaPhoID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2017_PhotonsMVAwp90.root)
  - scale factors 2018:
      - [cutBasedPhotonID-Fall17-94X-V2-loose](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_PhotonsLoose.root)
      - [cutBasedPhotonID-Fall17-94X-V2-medium](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_PhotonsMedium.root)
      - [cutBasedPhotonID-Fall17-94X-V2-tight](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_PhotonsTight.root)
      - [mvaPhoID-Fall17-iso-V2-wp80](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_PhotonsMVAwp80.root)
      - [mvaPhoID-Fall17-iso-V2-wp90](%PUBURL%/CMS/EgammaIDRecipesRun2/2018_PhotonsMVAwp90.root)

# E/gamma Energy Corrections

## Electron and Photon Energy Regression Corrections

The electron and photon energy corrections are applied by default to the
object. 2016Legacy & Prompt uses the V1 or "74X" regression while 2017
and 2018 use a modified version of the V2 or "80X" regression. This
modification is that the high pt ecal training is only used for
saturated electrons and photons.

## Residual Scale & Smearing Corrections

The data / MC energy rescale and resolution have a small residual miss
match. Therefore we scale the data to the MC and the smear the MC to
match the data resolution. This is known as scale & smearing
corrections. The scale and smear corrected energy can be accessed inside
the miniAOD object via
pat::Electron::userFloat('ecalTrkEnergyPostCorr"),
pat::Photon::userFloat('ecalEnergyPostCorr'). Some analyses use the ECAL
only energy of electrons and therefore use
pat::Electron::userFloat('ecalEnergyPostCorr'). Currently, these final
corrections are only availible for 2016 and 2017, although preliminary
ones are now availible [2018 Preliminary Energy
Correction](EgammaMiniAODV2#2018_Preliminary_Energy_Correcti)

To access the scale and smearings please see
[EgammaMiniAODV2\#Energy\_Scale\_and\_Smearing](EgammaMiniAODV2#Energy_Scale_and_Smearing)

# Recommendations on Combining Systematics between years

What follows are some simple recommendations on correlating the
systematics between the years which we feel are a resonable starting
point. The method for deciding the correlation depends on whether the
quantity is measured in its kinematic phase space or extrapolated its
kinematic phase space. The systematic uncertainty of a measured value is
dominated by biases associated with the measurement method. As long as
the method remains the same, we can reasonably assume that the method
bias will be the same each year. The systematic uncertainty of an
extrapolated value is dominated by the modelling of that extrapolation
by the Monte Carlo simulation and can change between years if new cuts,
new variables or new detectors are introduced. We absolutely encourage
feedback here and will update the recommendations based on this.

  - trigger efficiency:
      - uncertainties are negligible w.r.t to reco & ID unless there are
        bugs
  - RECO efficiency:
      - uncertainties are correlated between the years as they are
        measured with the same method
      - due to the larger backgrounds, we assume the RECO uncertainties
        are uncorrelated w.r.t to the ID uncertainties
  - ID efficiency
      - 20 to 200 GeV (near the Z peak): small stat errors, systematics
        dominate. This is a measurement and given the method doesnt
        change, its 100% correlated between the years
      - \>200 GeV: extrapolation based on confidence of the Monte Carlo
        simulation capturing the energy evolution of the ID variables
          - we decided 100% correlated between 2016 & 2017. A 50 GeV
            electron looks a lot like a 1 TeV electron pixel wise so any
            differences are already accounted for. Any energy
            disagrement would come from something else which is constant
            between the two years
          - it is yet unclear if 2018 is correlated or uncorrelated due
            to the HCAL endcap upgrade
              - <span class="twiki-macro RED"></span> UPDATE as of 14th
                Dec, 2020: Since most of the variables are ECAL related,
                we suggest to treat the ID systematics correlated
                between all the years unless there are strong points
                against it. <span class="twiki-macro ENDCOLOR"></span>

<!-- end list -->

  - conversion safe electron veto:
      - as this is arguably an extrapolation, we uncorrelate 2016, 2017
        and 2018 due to the different pixel detector / pixel running
        conditions between the years
  - energy scale:
      - the errors are: stat, systematic, gain
      - stat: neglibible and can be ignored
      - syst: a measurement, correlated between the years
      - gain: the error on the gain category mostly coming from the
        statistics of each gain category electrons and therefore it can
        be taken to be uncorrelated between the years. Really only
        important for gain1 which are our highest energy electrons. Also
        helps that 2016 and 2017 have different energy regressions which
        may be modelled differently in MC so they really should be
        uncorrelated.
  - energy resolution:
      - the errors are correlated between the years as they are a
        measurement and the same method is used in all years

# Summary of available Egamma POG ntuples

| 2016                                                                                     |
| :--------------------------------------------------------------------------------------- |
| Rereco version: /\*/Run2016\*17Jul2018**/** (legacy rereco)                              |
| MC samples: /\*/\*RunIISummer16MiniAODv3**/**                                            |
| egamma ntuples: /eos/cms/store/group/phys\_egamma/soffi/TnP/ntuples\_04162018-Legacy2016 |
| Regression: PF/SC/Egamma 74X /74X/74X trained                                            |
| Scale and smearing: embedded in MiniAOD V2                                               |
| JSON: Cert\_271036-284044\_13TeV\_23Sep2016ReReco\_Collisions16\_JSON.txt                |

| 2017                                                                                                                         |
| :--------------------------------------------------------------------------------------------------------------------------- |
| Rereco version: /\*/Run2017\*31Mar2018**/**                                                                                  |
| MC samples: /\*/\*12Apr2018**/**                                                                                             |
| egamma ntuples: /eos/cms/store/group/phys\_egamma/soffi/TnP/ntuples\_01162018/Moriond18\_V1                                  |
| egamma ntuples with same tag but additional variables: /eos/cms/store/group/phys\_egamma/micheli/TnP/ntuples\_2017\_20181116 |
| Regression: PF/SC/Egamma 94X /74X/80X trained                                                                                |
| Scale and smearing: embedded in MiniAOD V2                                                                                   |
| JSON: Cert\_294927-306462\_13TeV\_PromptReco\_Collisions17\_JSON.txt                                                         |

| 2018                                                                                                      |
| :-------------------------------------------------------------------------------------------------------- |
| Rereco version: /**/17Sep2018 (for A-C), promptReco (for D)/**                                            |
| MC samples: /\*/\*RunIIAutumn18DRPremix -102X\_upgrade2018\_realistic**/**                                |
| egamma ntuples:/eos/cms/store/group/phys\_egamma/swmukher/NtupleForRecoSF/Rereco2018Data\_Autumn18MC\_AOD |
| Regression: PF/SC/Egamma 74X /74X/74X trained                                                             |
| Scale and smearing: embedded in MiniAOD V2                                                                |
| JSON: Cert\_314472-325175\_13TeV\_PromptReco\_Collisions18\_JSON.txt                                      |
